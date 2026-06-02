package com.mytravelline.currency;

import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.config.AppProperties;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class CurrencyService {

    private final AppProperties appProperties;

    // 1 USD = X [currency code]
    private final Map<String, BigDecimal> rates = new ConcurrentHashMap<>();

    @PostConstruct
    void init() {
        Map<String, BigDecimal> configuredRates = appProperties.getExchangeRates();
        if (configuredRates != null) {
            configuredRates.forEach((code, rate) -> {
                if (rate != null && rate.compareTo(BigDecimal.ZERO) > 0) {
                    rates.put(code.toUpperCase(), rate);
                } else {
                    log.warn("Skipping invalid exchange rate for {}: {}", code, rate);
                }
            });
        }
        log.info("CurrencyService initialized with {} rates: {}", rates.size(),
                rates.entrySet().stream()
                        .map(e -> e.getKey() + "=" + e.getValue())
                        .collect(Collectors.joining(", ")));
    }

    public BigDecimal convert(BigDecimal usdAmount, String targetCurrency) {
        if (usdAmount == null) return null;
        if ("USD".equals(targetCurrency)) return usdAmount;

        BigDecimal rate = rates.get(targetCurrency.toUpperCase());
        if (rate == null) {
            throw new BadRequestException(
                    "Unsupported currency '" + targetCurrency + "'. Supported: " + getSupportedCodes());
        }
        return usdAmount.multiply(rate).setScale(2, RoundingMode.HALF_UP);
    }

    public boolean isSupported(String code) {
        if (code == null) return false;
        return "USD".equalsIgnoreCase(code) || rates.containsKey(code.toUpperCase());
    }

    public void validateCurrency(String code) {
        if (!isSupported(code)) {
            throw new BadRequestException(
                    "Unsupported currency '" + code + "'. Supported: " + getSupportedCodes());
        }
    }

    public List<CurrencyInfo> getSupportedCurrencies() {
        List<CurrencyInfo> result = Arrays.stream(CurrencyCode.values())
                .filter(c -> c == CurrencyCode.USD || rates.containsKey(c.name()))
                .map(c -> CurrencyInfo.builder()
                        .code(c.name())
                        .symbol(c.getSymbol())
                        .rateFromUsd(c == CurrencyCode.USD ? BigDecimal.ONE : rates.get(c.name()))
                        .build())
                .collect(Collectors.toList());
        return result;
    }

    public Map<String, BigDecimal> getRates() {
        return Map.copyOf(rates);
    }

    public void updateRate(String code, BigDecimal rate) {
        String upper = code.toUpperCase();
        if ("USD".equals(upper)) {
            throw new BadRequestException("Cannot update the USD base rate");
        }
        try {
            CurrencyCode.valueOf(upper);
        } catch (IllegalArgumentException e) {
            throw new BadRequestException("Unknown currency code '" + code + "'");
        }
        if (rate == null || rate.compareTo(BigDecimal.ZERO) <= 0) {
            throw new BadRequestException("Rate must be greater than 0");
        }
        rates.put(upper, rate);
        log.info("Exchange rate updated: 1 USD = {} {}", rate, upper);
    }

    private String getSupportedCodes() {
        return getSupportedCurrencies().stream()
                .map(CurrencyInfo::getCode)
                .collect(Collectors.joining(", "));
    }
}

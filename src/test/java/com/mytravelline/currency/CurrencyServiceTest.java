package com.mytravelline.currency;

import com.mytravelline.common.exception.BadRequestException;
import com.mytravelline.config.AppProperties;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class CurrencyServiceTest {

    private CurrencyService currencyService;

    @BeforeEach
    void setUp() {
        AppProperties props = new AppProperties();
        Map<String, BigDecimal> rates = new HashMap<>();
        rates.put("EUR", new BigDecimal("0.92"));
        rates.put("GBP", new BigDecimal("0.79"));
        rates.put("AMD", new BigDecimal("388.00"));
        props.setExchangeRates(rates);

        currencyService = new CurrencyService(props);
        currencyService.init();
    }

    @Test
    void convert_usdToUsd_returnsOriginal() {
        BigDecimal amount = new BigDecimal("100.00");
        assertThat(currencyService.convert(amount, "USD")).isEqualByComparingTo(amount);
    }

    @Test
    void convert_usdToEur_appliesRate() {
        BigDecimal result = currencyService.convert(new BigDecimal("100.00"), "EUR");
        assertThat(result).isEqualByComparingTo(new BigDecimal("92.00"));
    }

    @Test
    void convert_usdToAmd_appliesRate() {
        BigDecimal result = currencyService.convert(new BigDecimal("1.00"), "AMD");
        assertThat(result).isEqualByComparingTo(new BigDecimal("388.00"));
    }

    @Test
    void convert_unknownCurrency_throwsBadRequest() {
        assertThatThrownBy(() -> currencyService.convert(new BigDecimal("100"), "XYZ"))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Unsupported currency 'XYZ'");
    }

    @Test
    void convert_nullAmount_returnsNull() {
        assertThat(currencyService.convert(null, "EUR")).isNull();
    }

    @Test
    void isSupported_usd_returnsTrue() {
        assertThat(currencyService.isSupported("USD")).isTrue();
    }

    @Test
    void isSupported_configuredCurrency_returnsTrue() {
        assertThat(currencyService.isSupported("EUR")).isTrue();
    }

    @Test
    void isSupported_unknownCurrency_returnsFalse() {
        assertThat(currencyService.isSupported("XYZ")).isFalse();
    }

    @Test
    void updateRate_validRate_updatesInMemory() {
        currencyService.updateRate("EUR", new BigDecimal("0.95"));
        BigDecimal result = currencyService.convert(new BigDecimal("100.00"), "EUR");
        assertThat(result).isEqualByComparingTo(new BigDecimal("95.00"));
    }

    @Test
    void updateRate_usd_throwsBadRequest() {
        assertThatThrownBy(() -> currencyService.updateRate("USD", new BigDecimal("1.0")))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Cannot update the USD base rate");
    }

    @Test
    void updateRate_negativeRate_throwsBadRequest() {
        assertThatThrownBy(() -> currencyService.updateRate("EUR", new BigDecimal("-1.0")))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Rate must be greater than 0");
    }

    @Test
    void updateRate_zeroRate_throwsBadRequest() {
        assertThatThrownBy(() -> currencyService.updateRate("EUR", BigDecimal.ZERO))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Rate must be greater than 0");
    }

    @Test
    void getSupportedCurrencies_includesUsdWithRateOne() {
        var currencies = currencyService.getSupportedCurrencies();
        var usd = currencies.stream().filter(c -> "USD".equals(c.getCode())).findFirst();
        assertThat(usd).isPresent();
        assertThat(usd.get().getRateFromUsd()).isEqualByComparingTo(BigDecimal.ONE);
    }

    @Test
    void getSupportedCurrencies_includesConfiguredRates() {
        var codes = currencyService.getSupportedCurrencies().stream()
                .map(CurrencyInfo::getCode)
                .toList();
        assertThat(codes).contains("USD", "EUR", "GBP", "AMD");
    }

    @Test
    void validateCurrency_unknown_throwsBadRequest() {
        assertThatThrownBy(() -> currencyService.validateCurrency("FOO"))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Supported:");
    }
}

package com.mytravelline.currency;

import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;

@Getter
@Builder
public class CurrencyInfo {
    private String code;
    private String symbol;
    private BigDecimal rateFromUsd;
}

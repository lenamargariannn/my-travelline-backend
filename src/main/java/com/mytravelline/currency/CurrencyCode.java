package com.mytravelline.currency;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum CurrencyCode {
    USD("$"),
    EUR("€"),
    GBP("£"),
    AMD("֏"),
    RUB("₽"),
    AED("د.إ");

    private final String symbol;
}

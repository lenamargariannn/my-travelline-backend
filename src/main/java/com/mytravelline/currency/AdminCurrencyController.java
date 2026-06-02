package com.mytravelline.currency;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/currencies")
@RequiredArgsConstructor
public class AdminCurrencyController {

    private final CurrencyService currencyService;

    @GetMapping("/rates")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Map<String, BigDecimal>> getRates() {
        return ResponseEntity.ok(currencyService.getRates());
    }

    @PutMapping("/rates/{code}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> updateRate(
            @PathVariable String code,
            @RequestBody Map<String, BigDecimal> body) {
        BigDecimal rate = body.get("rate");
        currencyService.updateRate(code, rate);
        return ResponseEntity.noContent().build();
    }
}

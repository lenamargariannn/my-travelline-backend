package com.mytravelline.common;

import com.mytravelline.translation.LocaleCode;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;

@Component
public class LocaleResolver {

    public LocaleCode resolve(HttpServletRequest request) {
        String param = request.getParameter("lang");
        if (param != null) return parse(param);

        String header = request.getHeader("Accept-Language");
        if (header != null && !header.isBlank()) {
            String tag = header.split("[,;]")[0].trim();
            String code = tag.length() >= 2 ? tag.substring(0, 2).toLowerCase() : tag.toLowerCase();
            return parse(code);
        }

        return LocaleCode.EN;
    }

    private LocaleCode parse(String code) {
        return switch (code.toLowerCase()) {
            case "hy" -> LocaleCode.HY;
            case "ru" -> LocaleCode.RU;
            default   -> LocaleCode.EN;
        };
    }
}

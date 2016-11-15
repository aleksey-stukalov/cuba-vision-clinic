/*
 * TODO Copyright
 */

package com.company.cubavisionclinic.web.formatters;

import com.haulmont.cuba.core.global.Configuration;
import com.haulmont.cuba.gui.components.Formatter;

import java.math.BigDecimal;
import java.util.Currency;

/**
 * Created by shiryaeva on 14.11.2016.
 */
public class CurrencyFormatter implements Formatter <BigDecimal> {

    @Override
    public String format(BigDecimal value) {
        return (value.setScale(2, BigDecimal.ROUND_UNNECESSARY))+"$";
    }
}

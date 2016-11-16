/*
 * TODO Copyright
 */

package com.company.cubavisionclinic.web.formatters;

import com.haulmont.cuba.gui.components.Formatter;

import java.math.BigDecimal;

public class CurrencyFormatter implements Formatter <BigDecimal> {

    @Override
    public String format(BigDecimal value) {
        return (value.setScale(2, BigDecimal.ROUND_HALF_EVEN)) + "$";
    }
}

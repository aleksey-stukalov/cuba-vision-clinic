package com.company.cubavisionclinic.entity;

import com.haulmont.chile.core.datatypes.impl.EnumClass;

import javax.annotation.Nullable;


public enum AppointmentType implements EnumClass<Integer> {

    ANNUAL(0),
    FOLLOWUP(1),
    EMERGENCY(2);

    private Integer id;

    AppointmentType(Integer value) {
        this.id = value;
    }

    public Integer getId() {
        return id;
    }

    @Nullable
    public static AppointmentType fromId(Integer id) {
        for (AppointmentType at : AppointmentType.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}
/*
 * Copyright (c) 2008-2016 Haulmont.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
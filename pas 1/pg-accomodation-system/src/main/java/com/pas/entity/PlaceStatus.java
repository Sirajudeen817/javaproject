package com.pas.entity;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "Represents the availability status of a PG place")
public enum PlaceStatus {
    @Schema(description = "PG is available for tenants")
    AVAILABLE,

    @Schema(description = "PG is currently occupied")
    OCCUPIED
}

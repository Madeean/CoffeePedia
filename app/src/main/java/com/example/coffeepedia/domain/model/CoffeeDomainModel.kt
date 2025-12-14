package com.example.coffeepedia.domain.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class CoffeeDomainModel(
    val title: String,
    val description: String,
    val ingredients: List<String>,
    val image: String,
    val id: String,
) : Parcelable
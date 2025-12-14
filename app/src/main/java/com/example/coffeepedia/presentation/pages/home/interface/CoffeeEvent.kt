package com.example.coffeepedia.presentation.pages.home.`interface`

import com.example.coffeepedia.domain.model.CoffeeDomainModel

sealed class CoffeeEvent {
    data class Click(val data: CoffeeDomainModel) : CoffeeEvent()
}

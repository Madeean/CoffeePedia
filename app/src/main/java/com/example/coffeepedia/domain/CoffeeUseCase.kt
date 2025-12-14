package com.example.coffeepedia.domain

import com.example.coffeepedia.domain.model.CoffeeDomainModel
import kotlinx.coroutines.flow.Flow

interface CoffeeUseCase {
    fun getAllHotCoffee(): Flow<List<CoffeeDomainModel>>
    fun getAllIceCoffee(): Flow<List<CoffeeDomainModel>>
}
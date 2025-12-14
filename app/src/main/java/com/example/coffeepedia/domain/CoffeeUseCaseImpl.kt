package com.example.coffeepedia.domain

import com.example.coffeepedia.domain.model.CoffeeDomainModel
import kotlinx.coroutines.flow.Flow

class CoffeeUseCaseImpl(private val repository: CoffeeRepository) : CoffeeUseCase {
    override fun getAllHotCoffee(): Flow<List<CoffeeDomainModel>> {
        return repository.getAllHotCoffee()
    }

}
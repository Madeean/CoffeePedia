package com.example.coffeepedia.data.repository

import com.example.coffeepedia.data.repository.model.CoffeeResponse.Companion.toDomainList
import com.example.coffeepedia.data.repository.service.CoffeeApiService
import com.example.coffeepedia.domain.CoffeeRepository
import com.example.coffeepedia.domain.model.CoffeeDomainModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn

class CoffeeRepositoryImpl(private val api: CoffeeApiService) : CoffeeRepository {
    override fun getAllHotCoffee(): Flow<List<CoffeeDomainModel>> = flow {
        val response = api.getAllHotCoffee()

        emit(response.toDomainList())
    }.flowOn(Dispatchers.IO)

    override fun getAllIceCoffee(): Flow<List<CoffeeDomainModel>> = flow {
        val response = api.getAllIceCoffee()

        emit(response.toDomainList())
    }.flowOn(Dispatchers.IO)

}
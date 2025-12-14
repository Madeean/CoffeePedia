package com.example.coffeepedia.data.repository.service

import com.example.coffeepedia.data.repository.model.CoffeeResponse
import retrofit2.http.GET

interface CoffeeApiService {

    @GET("coffee/hot")
    suspend fun getAllHotCoffee(): List<CoffeeResponse>

    @GET("coffee/iced")
    suspend fun getAllIceCoffee(): List<CoffeeResponse>
}
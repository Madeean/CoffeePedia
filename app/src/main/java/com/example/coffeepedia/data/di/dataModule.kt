package com.example.coffeepedia.data.di

import com.example.coffeepedia.data.repository.CoffeeRepositoryImpl
import com.example.coffeepedia.domain.CoffeeRepository
import org.koin.dsl.module

val dataModule = module {

    single<CoffeeRepository> {
        CoffeeRepositoryImpl(
            api = get()
        )
    }
}
package com.example.coffeepedia.domain.di

import com.example.coffeepedia.domain.CoffeeUseCase
import com.example.coffeepedia.domain.CoffeeUseCaseImpl
import org.koin.dsl.module

val domainModule = module {

    factory<CoffeeUseCase> {
        CoffeeUseCaseImpl(
            repository = get()
        )
    }
}
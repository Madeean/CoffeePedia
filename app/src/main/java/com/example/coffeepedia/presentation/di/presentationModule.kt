package com.example.coffeepedia.presentation.di

import com.example.coffeepedia.presentation.pages.home.viewmodel.CoffeeViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val presentationModule = module {

    viewModel {
        CoffeeViewModel(
            useCase = get()
        )
    }
}
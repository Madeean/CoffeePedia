package com.example.coffeepedia.data.di

import com.chuckerteam.chucker.api.ChuckerInterceptor
import com.example.coffeepedia.data.repository.service.CoffeeApiService
import com.example.coffeepedia.data.utils.IngredientsDeserializer
import com.google.gson.GsonBuilder
import com.google.gson.reflect.TypeToken
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

val networkModule = module {

    single {
        HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BODY
        }
    }

    single {
        OkHttpClient.Builder()
            .addInterceptor(get<HttpLoggingInterceptor>())
            .addInterceptor(ChuckerInterceptor(androidContext()))
            .build()
    }

    single {
        Retrofit.Builder()
            .baseUrl("https://api.sampleapis.com/")
            .client(get())
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    single<CoffeeApiService> {
        get<Retrofit>().create(CoffeeApiService::class.java)
    }
}
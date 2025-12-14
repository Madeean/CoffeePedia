package com.example.coffeepedia

import android.app.Application
import com.example.coffeepedia.data.di.dataModule
import com.example.coffeepedia.data.di.networkModule
import com.example.coffeepedia.domain.di.domainModule
import com.example.coffeepedia.presentation.di.presentationModule
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.GlobalContext.startKoin

class CoffeePediaApp : Application() {

    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@CoffeePediaApp)
            modules(
                networkModule,
                dataModule,
                domainModule,
                presentationModule
            )
        }
    }
}
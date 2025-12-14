package com.example.coffeepedia.presentation.pages.home.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.coffeepedia.domain.CoffeeUseCase
import com.example.coffeepedia.domain.model.CoffeeDomainModel
import com.example.coffeepedia.presentation.util.UiState
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.onStart
import kotlinx.coroutines.launch

class CoffeeViewModel(
    private val useCase: CoffeeUseCase
) : ViewModel() {

    private val _hotCoffeeState =
        MutableStateFlow<UiState<List<CoffeeDomainModel>>>(UiState.Idle)

    val hotCoffeeState: StateFlow<UiState<List<CoffeeDomainModel>>> =
        _hotCoffeeState.asStateFlow()

    fun getHotCoffee() {
        viewModelScope.launch {
            useCase.getAllHotCoffee()
                .onStart {
                    _hotCoffeeState.value = UiState.Loading
                }
                .catch { e ->
                    _hotCoffeeState.value =
                        UiState.Error(e.message ?: "Failed to load coffee", e)
                }
                .collect { data ->
                    _hotCoffeeState.value = UiState.Success(data)
                }
        }
    }
}
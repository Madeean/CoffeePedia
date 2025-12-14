package com.example.coffeepedia.presentation.pages.home.fragment.ice

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.repeatOnLifecycle
import androidx.recyclerview.widget.GridLayoutManager
import com.example.coffeepedia.databinding.FragmentIceBinding
import com.example.coffeepedia.presentation.pages.home.fragment.ice.adapter.CoffeeIceAdapter
import com.example.coffeepedia.presentation.pages.home.viewmodel.CoffeeViewModel
import com.example.coffeepedia.presentation.util.UiState
import com.example.coffeepedia.presentation.util.base.BaseFragment
import kotlinx.coroutines.launch
import org.koin.androidx.viewmodel.ext.android.activityViewModel

class IceFragment : BaseFragment<FragmentIceBinding>() {
    private val viewModel: CoffeeViewModel by activityViewModel()

    private val coffeeAdapter by lazy { CoffeeIceAdapter() }

    override fun inflateBinding(
        inflater: LayoutInflater,
        container: ViewGroup?
    ): FragmentIceBinding {
        return FragmentIceBinding.inflate(inflater)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        setupAdapter()
        setupObserve()
        setupHitData()
    }

    private fun setupHitData() {
        viewModel.getIceCoffee()
    }

    private fun setupObserve() {
        observeIceCoffee()
    }

    private fun setupAdapter() {
        binding.rvCoffeeIce.apply {
            layoutManager = GridLayoutManager(requireContext(), 2)
            adapter = coffeeAdapter
        }
    }

    private fun observeIceCoffee() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewLifecycleOwner.lifecycle.repeatOnLifecycle(Lifecycle.State.STARTED) {
                viewModel.iceCoffeeState.collect { state ->
                    when (state) {
                        is UiState.Idle -> Unit

                        is UiState.Loading -> {
                            showLoading()
                        }

                        is UiState.Success -> {
                            hideLoading()
                            coffeeAdapter.submitList(state.data)
                        }

                        is UiState.Error -> {
                            createLog(state.message)
                            hideLoading()
                            Toast.makeText(
                                requireContext(), state.message, Toast.LENGTH_SHORT
                            ).show()
                        }
                    }
                }
            }
        }
    }
}
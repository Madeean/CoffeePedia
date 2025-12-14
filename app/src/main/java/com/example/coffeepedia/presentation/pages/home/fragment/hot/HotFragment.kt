package com.example.coffeepedia.presentation.pages.home.fragment.hot

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.repeatOnLifecycle
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.coffeepedia.databinding.FragmentHotBinding
import com.example.coffeepedia.presentation.pages.home.fragment.hot.adapter.CoffeeHotAdapter
import com.example.coffeepedia.presentation.pages.home.viewmodel.CoffeeViewModel
import com.example.coffeepedia.presentation.util.UiState
import com.example.coffeepedia.presentation.util.base.BaseFragment
import kotlinx.coroutines.launch
import org.koin.androidx.viewmodel.ext.android.activityViewModel

class HotFragment : BaseFragment<FragmentHotBinding>() {
    private val viewModel: CoffeeViewModel by activityViewModel()
    private val coffeeAdapter by lazy { CoffeeHotAdapter() }

    override fun inflateBinding(
        inflater: LayoutInflater, container: ViewGroup?
    ): FragmentHotBinding {
        return FragmentHotBinding.inflate(inflater)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        setupAdapter()
        setupObserve()
        setupHitData()
    }

    private fun setupHitData() {
        viewModel.getHotCoffee()
    }

    private fun setupObserve() {
        observeHotCoffee()
    }

    private fun setupAdapter() {
        binding.rvCoffeeHot.apply {
            layoutManager = LinearLayoutManager(requireContext())
            adapter = coffeeAdapter
        }
    }

    private fun observeHotCoffee() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewLifecycleOwner.lifecycle.repeatOnLifecycle(Lifecycle.State.STARTED) {
                viewModel.hotCoffeeState.collect { state ->
                    when (state) {
                        is UiState.Idle -> Unit

                        is UiState.Loading -> {
                            showLoading()
                        }

                        is UiState.Success -> {
                            hideLoading()
                            binding.rvCoffeeHot.post {
                                coffeeAdapter.submitList(state.data)
                            }
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
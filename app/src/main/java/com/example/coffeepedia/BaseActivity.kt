package com.example.coffeepedia

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.viewbinding.ViewBinding
import com.example.coffeepedia.databinding.LoadingOverlayBinding
import timber.log.Timber

abstract class BaseActivity<VB : ViewBinding> : AppCompatActivity() {

    private var _binding: VB? = null
    protected val binding get() = _binding!!

    private lateinit var loadingBinding: LoadingOverlayBinding

    abstract fun inflateBinding(layoutInflater: LayoutInflater): VB

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Timber.plant(Timber.DebugTree())


        // inflate main layout
        _binding = inflateBinding(layoutInflater)
        setContentView(binding.root)

        // inflate overlay loading
        loadingBinding = LoadingOverlayBinding.inflate(layoutInflater)
        addContentView(
            loadingBinding.root,
            ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
        )
    }

    // Show loading
    fun showLoading() {
        loadingBinding.root.visibility = View.VISIBLE
    }

    // Hide loading
    fun hideLoading() {
        loadingBinding.root.visibility = View.GONE
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}
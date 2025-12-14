package com.example.coffeepedia.presentation.util.base

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.viewbinding.ViewBinding
import timber.log.Timber

abstract class BaseFragment<VB : ViewBinding> : Fragment() {

    private var _binding: VB? = null
    protected val binding get() = _binding!!

    abstract fun inflateBinding(
        inflater: LayoutInflater,
        container: ViewGroup?
    ): VB

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = inflateBinding(inflater, container)
        Timber.plant(Timber.DebugTree())
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    /** akses BaseActivity */
    protected fun baseActivity(): BaseActivity<*>? {
        return activity as? BaseActivity<*>
    }

    /** helper loading */
    protected fun showLoading() {
        baseActivity()?.showLoading()
    }

    protected fun hideLoading() {
        baseActivity()?.hideLoading()
    }

    protected fun createLog(message: String) {
        baseActivity()?.createLog(message)
    }
}
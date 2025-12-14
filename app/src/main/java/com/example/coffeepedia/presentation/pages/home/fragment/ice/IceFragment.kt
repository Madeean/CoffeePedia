package com.example.coffeepedia.presentation.pages.home.fragment.ice

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.coffeepedia.R
import com.example.coffeepedia.databinding.FragmentIceBinding
import com.example.coffeepedia.presentation.util.base.BaseFragment

class IceFragment : BaseFragment<FragmentIceBinding>() {
    override fun inflateBinding(
        inflater: LayoutInflater,
        container: ViewGroup?
    ): FragmentIceBinding {
        return FragmentIceBinding.inflate(inflater)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

    }
}
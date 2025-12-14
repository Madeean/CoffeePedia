package com.example.coffeepedia.presentation.pages.home

import android.os.Bundle
import android.view.LayoutInflater
import androidx.fragment.app.Fragment
import com.example.coffeepedia.R
import com.example.coffeepedia.databinding.ActivityHomeBinding
import com.example.coffeepedia.presentation.pages.home.fragment.hot.HotFragment
import com.example.coffeepedia.presentation.pages.home.fragment.ice.IceFragment
import com.example.coffeepedia.presentation.util.base.BaseActivity

class HomeActivity : BaseActivity<ActivityHomeBinding>() {
    override fun inflateBinding(layoutInflater: LayoutInflater): ActivityHomeBinding {
        return ActivityHomeBinding.inflate(layoutInflater)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setFragment(HotFragment())
        setAppBar("Hot Coffee")
        setBottomNavigationView()
    }

    private fun setBottomNavigationView() {
        binding.bottomNav.setOnItemSelectedListener {
            when (it.itemId) {
                R.id.hotFragment -> {
                    setFragment(HotFragment())
                    setAppBar("Hot Coffee")
                }

                R.id.iceFragment -> {
                    setFragment(IceFragment())
                    setAppBar("Ice Coffee")
                }
            }
            true
        }
    }

    private fun setFragment(fragment: Fragment) {
        supportFragmentManager.beginTransaction()
            .replace(binding.fragmentContainer.id, fragment)
            .commit()
    }

    private fun setAppBar(title: String) {
        binding.toolbar.tvToolbar.text = title
    }
}
package com.example.coffeepedia.presentation.pages.home.fragment.ice.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.coffeepedia.R
import com.example.coffeepedia.databinding.ItemCoffeeBinding
import com.example.coffeepedia.domain.model.CoffeeDomainModel

class CoffeeIceAdapter :
    ListAdapter<CoffeeDomainModel, CoffeeIceAdapter.CoffeeViewHolder>(HotDiffCallback()) {
    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): CoffeeViewHolder {
        val binding = ItemCoffeeBinding.inflate(
            LayoutInflater.from(parent.context),
            parent,
            false
        )
        return CoffeeViewHolder(binding)
    }

    override fun onBindViewHolder(holder: CoffeeViewHolder, position: Int) {
        holder.bind(getItem(position))
    }

    class CoffeeViewHolder(
        private val binding: ItemCoffeeBinding
    ) : RecyclerView.ViewHolder(binding.root) {
        fun bind(item: CoffeeDomainModel) {
            binding.apply {
                tvJudul.text = item.title
                tvEpisode.text = item.description
                tvDate.text = item.id

                Glide.with(ivImage.context)
                    .load(item.image)
                    .error(R.drawable.qrimage)
                    .fallback(R.drawable.qrimage)
                    .into(ivImage)
            }
        }
    }

    private class HotDiffCallback : DiffUtil.ItemCallback<CoffeeDomainModel>() {
        override fun areItemsTheSame(
            oldItem: CoffeeDomainModel,
            newItem: CoffeeDomainModel
        ): Boolean {
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(
            oldItem: CoffeeDomainModel,
            newItem: CoffeeDomainModel
        ): Boolean {
            return oldItem == newItem
        }
    }
}
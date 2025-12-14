package com.example.coffeepedia.data.repository.model

import com.example.coffeepedia.domain.model.CoffeeDomainModel

data class CoffeeResponse(
    val title: String?,
    val description: String?,
    val ingredients: Any?,
    val image: Any?,
    val id: String?,
){
    companion object {
        fun CoffeeResponse.toDomain(): CoffeeDomainModel {
            val parsedIngredients: List<String> = when (ingredients) {
                is String -> {
                    ingredients
                        .split(",")
                        .map { it.trim() }
                        .filter { it.isNotEmpty() }
                }

                is List<*> -> {
                    ingredients
                        .mapNotNull { it?.toString()?.trim() }
                        .filter { it.isNotEmpty() }
                }

                else -> emptyList()
            }

            val parseImages: String = when (image) {
                is String -> {
                    image
                }

                is List<*> -> {
                    image.elementAt(0).toString()
                }

                else -> ""
            }

            return CoffeeDomainModel(
                id = id.orEmpty(),
                title = title.orEmpty(),
                description = description.orEmpty(),
                image = parseImages,
                ingredients = parsedIngredients
            )
        }

        fun List<CoffeeResponse>.toDomainList(): List<CoffeeDomainModel> =
            map { it.toDomain() }
    }
}

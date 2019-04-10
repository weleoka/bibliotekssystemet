package se.ltu.studentgruppvt19.bibliotekssystemet.data;

import org.springframework.data.repository.CrudRepository;
import se.ltu.studentgruppvt19.bibliotekssystemet.domain.Ingredient;

public interface IngredientRepository extends CrudRepository<Ingredient, String> {
}
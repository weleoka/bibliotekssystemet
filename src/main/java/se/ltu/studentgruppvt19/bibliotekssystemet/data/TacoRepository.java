package se.ltu.studentgruppvt19.bibliotekssystemet.data;

import org.springframework.data.repository.CrudRepository;
import se.ltu.studentgruppvt19.bibliotekssystemet.domain.Ingredient;
import se.ltu.studentgruppvt19.bibliotekssystemet.domain.Taco;

public interface TacoRepository extends CrudRepository<Taco, String> {
}
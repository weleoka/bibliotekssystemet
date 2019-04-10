package se.ltu.studentgruppvt19.bibliotekssystemet.data;

import org.springframework.data.repository.CrudRepository;
import se.ltu.studentgruppvt19.bibliotekssystemet.domain.Order;

public interface OrderRepository extends CrudRepository<Order, Long> {
}

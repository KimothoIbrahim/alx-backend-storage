-- using triggers

-- Decrease item on order
CREATE TRIGGER man_items AFTER INSERT ON orders
FOR EACH ROW UPDATE items SET quantity=quantity - NEW.number
WHERE name = NEW.item_name;

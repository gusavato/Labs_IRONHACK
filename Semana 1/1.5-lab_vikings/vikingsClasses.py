
import random

# Soldier


class Soldier:

    def __init__(self, health, strength) -> None:
        self.health = health
        self.strength = strength

    def attack(self):
        return self.strength

    def receiveDamage(self, damage):
        self.health -= damage

# Viking


class Viking(Soldier):

    def __init__(self, name, health, strength) -> None:
        super().__init__(health, strength)
        self.name = name

    def attack(self):
        return super().attack()

    def receiveDamage(self, damage):
        self.health -= damage
        if self.health > 0:
            return f'{self.name} has received {damage} points of damage'
        else:
            return f'{self.name} has died in act of combat'

    def battleCry(self):
        return "Odin Owns You All!"


# Saxon


class Saxon(Soldier):
    def __init__(self, health, strength) -> None:
        super().__init__(health, strength)

    def attack(self):
        return super().attack()

    def receiveDamage(self, damage):
        self.health -= damage
        if self.health > 0:
            return f'A Saxon has received {damage} points of damage'
        else:
            return f'A Saxon has died in combat'
# War


class War:
    def __init__(self) -> None:
        self.vikingArmy = []
        self.saxonArmy = []

    def addViking(self, viking: Viking):
        self.vikingArmy.append(viking)

    def addSaxon(self, saxon: Saxon):
        self.saxonArmy.append(saxon)

    def vikingAttack(self):
        vik_soldier = random.choice(self.vikingArmy)
        sax_soldier = random.choice(self.saxonArmy)
        result = sax_soldier.receiveDamage(vik_soldier.strength)
        if sax_soldier.health <= 0:
            self.saxonArmy.remove(sax_soldier)

        return result

    def saxonAttack(self):
        vik_soldier = random.choice(self.vikingArmy)
        sax_soldier = random.choice(self.saxonArmy)
        result = vik_soldier.receiveDamage(sax_soldier.strength)
        if vik_soldier.health <= 0:
            self.vikingArmy.remove(vik_soldier)

        return result

    def showStatus(self):
        if self.saxonArmy == []:
            return "Vikings have won the war of the century!"
        elif self.vikingArmy == []:
            return 'Saxons have fought for their lives and survive another day...'
        elif self.saxonArmy != [] and self.vikingArmy != []:
            return "Vikings and Saxons are still in the thick of battle."

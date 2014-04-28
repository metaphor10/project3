animal(mammal,tiger,carnivore,stripes).
animal(mammal,hyena,carnivore,ugly).
animal(mammal,lion,carnivore,mane).
animal(bird,eagle,carnivore,large).
animal(bird,sparrow,scavanger,small).
animal(reptile,snake,carnivore,long).
animal(reptile,lizard,scavanger,small).
acarnivore(X):-animal(_,X,carnivore,_).
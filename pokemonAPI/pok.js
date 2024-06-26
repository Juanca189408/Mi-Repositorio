document.addEventListener('DOMContentLoaded', function() {
    const url = 'https://pokeapi.co/api/v2/pokemon/250';

    fetch(url)
        .then(response => response.json())
        .then(data => {
            console.log(data);

            const pokemonInfo = document.getElementById('pokemon-info');

            
            const nameElement = document.createElement('p');
            nameElement.textContent = `Name: ${data.name}`;

            const idElement = document.createElement('p');
            idElement.textContent = `ID: ${data.id}`;

            const types = data.types.map(type => type.type.name).join(', ');
            const typesElement = document.createElement('p');
            typesElement.textContent = `Types: ${types}`;

            const abilities = data.abilities.map(ability => ability.ability.name).join(', ');
            const abilitiesElement = document.createElement('p');
            abilitiesElement.textContent = `Abilities: ${abilities}`;

            pokemonInfo.appendChild(nameElement);
            pokemonInfo.appendChild(idElement);
            pokemonInfo.appendChild(typesElement);
            pokemonInfo.appendChild(abilitiesElement);
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
});

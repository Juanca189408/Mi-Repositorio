const marvel = {
  render: () => {
      const urlAPI = 'https://gateway.marvel.com/v1/public/characters?ts=1&apikey=4765e9a6bf78779f696b289a97309df4&hash=6852d84d7e491e4eaa5e082611c6d114';
      const container = document.querySelector('#marvel-row');
      let contentHTML = '';

      fetch(urlAPI)
          .then(res => res.json())
          .then((json) => {
              for (const hero of json.data.results) {
                  let urlHero = hero.urls[0].url;
                  contentHTML += `
                      <div class="col-md-4">
                          <a href="${urlHero}" target="_blank">
                              <img src="${hero.thumbnail.path}.${hero.thumbnail.extension}" alt="${hero.name}" class="img-thumbnail">
                          </a>
                          <h3 class="title">${hero.name}</h3>
                      </div>`;
              }
              container.innerHTML = contentHTML;
          });
  }
};

marvel.render();

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import vueResource from 'vue-resource';
import TurboLinksAdapter from 'vue-turbolinks';

Vue.use(TurboLinksAdapter);
Vue.use(vueResource);


document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById("containers")
  if (element != null) {
  const app = new Vue({
    el: '#containers',
    data: {
      reviews: []

    },

    created(){

        this.$http.get("/").then(res => {

            this.reviews = res.body.reviews
          console.log("this is the console log")


            for(let reviews of res.body.reviews){
            // this.$data.userVoted = reviews.user_voted
                // this.userVoted = reviews.user_voted
                this.userLikes = reviews.likes
                this.$data.userVotedUp = reviews.voted_up
                this.userVotedDown = reviews.voted_down

            }
        })
      },
    template: "<App :new_reviews='reviews' />",
    components: { App },
  })
  }
})
import "actiontext"

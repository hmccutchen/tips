<template>
  <div id="app">
    <Search @filter-method="searchRestaurants" />
    <article class="container">
      <div class="row">
        <div v-for= "review in filterRestaurants" :key="review.id">
          <div class="col-md-12">
            <div class="card">
              <div class="hero">
                <h2> {{review.restaurant.name}} </h2>
                <a :href="'/reviews/' + review.id"><img class="image-post" :src= "review.restaurant.picture" alt=""></a><br>
                <span> {{review.restaurant.address.replace(/[\[\]']+/g,"").replace(/"/g,"")}}</span> <br>

                <span> {{review.restaurant.price_range}}</span><br>
              </div>


              <div class=info>
                  <span class="rtitle"><b>{{review.title.charAt(0).toUpperCase() + review.title.slice(1)}}</b></span><br>
                  <span><b>Role:</b>
                  {{review.role}}
                  </span><br>
                  <span><b>Clientele:</b>
                  </span><br>
                  <span v-for="star in review.clientele">
                    <span class="star">
                    </span>
                  </span><br>
                  <span><b>Team:</b>
                  </span><br>
                  <span v-for="star in review.team">
                    <span class="star">
                    </span>
                  </span> <br>
                  <span><b>Management:</b>
                  </span><br>
                  <span v-for= "star in  review.management">
                    <span class="star">
                    </span>
                  </span> <br>
                  <span><b>Tip Avg: </b>
                  </span>
                  {{review.tip_avg}} /hr<br>
                  <span><b>Overall Rating:</b>
                  </span><br>
                  <span v-for="star in review.rating">
                    <span class="star">
                    </span>
                  </span><br>

                     <button v-if=" review.likes > 0" class="tips btn btn-danger" @click="unlikeReview(review)">
                      No tip

                     </button>



                     <button v-else-if="review.likes === 0" class="tips btn btn-primary" @click="likeReview(review)">
                       Tip

                      </button>

              </div>
            </div>
          </div>
        </div>
      </div>
    </article>
  </div>
</template>

  <script>
    import Search from '../javascript/components/Search.vue';

    export default {
      name: 'app',
      components: { Search },
      props: ["new_reviews"],

      data() {
        return {
          searchString: ''

        }
      },

      methods: {

        likeReview(review){

          this.$http.put(`/pages/${review.id}/like`).then(res => {

                  if(res.body.voted_up){
                    review.likes += 1
                  }

          }).catch(e => console.log(e))
        },

        unlikeReview(review){
          this.$http.put(`/pages/${review.id}/unlike`).then(res =>{



             if(res.body.voted_down === false){
              review.likes -= 1
                  }




          }).catch(e => console.log(e))
        },

        searchRestaurants(e){
          this.searchString = e

        }

      },

      computed: {

        filterRestaurants(searchString){
          let reviews = this.new_reviews;
          const filterString = this.searchString;

          filterString.trim().toLowerCase();

           reviews = reviews.filter((review)=> {
            if(review.restaurant.name.toLowerCase().indexOf(filterString) !== -1){
              return review;

            }
          })
          return reviews
        }
      }

    }

  </script>

  <style scoped>
  .space{
    margin: 10px;
  }

</style>

<template>
  <div id="app">

    <article class="container">
      <div class="row">
        <div v-for= "review in new_reviews">
          <div class="col-md-12">
            <div class="card">
              <div class="hero">
                <h2> {{review.restaurant.name}} </h2>
                <a :href="'/reviews/' + review.id"><img class="image-post" :src= "review.restaurant.picture" alt=""></a><br>
                <span> {{review.restaurant.address}}</span> <br>
                <span> {{review.restaurant.price_range}}</span><br>
              </div>


              <div class=info>
                  <span class="rtitle"><b>{{review.title.charAt(0).toUpperCase() + review.title.slice(1)}}</b></span><br>
                  <span><b>Role:</b>
                  </span><br>
                  {{review.role}}<br>
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
                   <span v-if="review.like_by">
                    <span :class=`tips tdis-{{review.id}}` id="disliking">
                      <!--I need to add the HTTP route methods for the links ie. PUT the html links are attmepted -->
                        <a href="/pages/:id=review.id/unlike">

                        </a>

                    </span>
                   </span>
                   <span v-else>
                    <span  id="liking">

                      <button :class="tips" v-on:click="likeReview(review)">
                        Like
                      </button>


                      </span>
                   </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </article>
  </div>
</template>

  <script>
    export default {
      props: ["new_reviews"],
      methods: {
        likeReview(review){

          this.$http.put(`/pages/ + ${review.id} + /like`).then(response => {

          })

        }
      }
    }

  </script>

  <style scoped>
  .space{
    margin: 10px;
  }

</style>

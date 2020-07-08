<template>
  <div class='container'>

    <input type="text" v-model="filterText" @keyup='filterMethod(filterText)' placeholder="Type Restaurant Name" />
  </div>
</template>

<script>

  export default {
    name: 'Search',

    data(){
      return {
      filterText: ''
     }
    },



    methods: {

      filterMethod(filterText){

        this.$emit('filter-method', filterText);
      //need to write some logic that will grab user text
      // then sends the text from the form emit it to the parent component app
      // use this text to modify the view to only show the collection of those restaurants in the view

      }
    }
  }
</script>

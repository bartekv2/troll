<template>
  <div id="attempts">
  </div>
</template>

<script>
methods: {
  time() {
    var self = this
    setInterval(self.time, 1000)
  },
},
mounted: function() {
  this.time()
}
</script>

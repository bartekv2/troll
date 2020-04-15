<template>
  <div id="timer">
    <p>{{ formatted }}</p>
  </div>
</template>

<script>
export default {
  props: {
    time_left: {
      required: true
    }
  },
  created() {
     setInterval(this.countDown, 1000);
  },
  data() {
    return {
      formatted: Math.floor(this.time_left / 60).toString().padStart(2, '0') + ':' + (this.time_left % 60).toString().padStart(2, '0')
    }
  },
  methods: {
    countDown: function() {
      this.time_left -= 1;
      let hours = Math.floor(this.time_left / 60 / 60);
      let minutes = Math.floor(this.time_left / 60) - (hours * 60);
      let seconds = this.time_left % 60;
      this.formatted = minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');
      if (this.time_left < 1) {
        location.reload();
        this.time_left = 0;
        this.formatted = "00:00";

      }
    }
  }
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

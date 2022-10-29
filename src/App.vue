<script setup>
import { ref } from 'vue'
import request from './http/request'
let data = [];
let sites = ref(data)
request.get(import.meta.env.VITE_BASE_URL+'data.json')
  .then(function (response) {
    data = response.data;
    sites.value = eval(data);
  });

let inputText = ref("")
function increment() {
  sites.value = eval(data);
  sites.value = sites.value.filter(item => {
    var matchGroupName = item.groupName.indexOf(inputText.value) != -1;
    if (matchGroupName) {
      return matchGroupName;
    }
    item.sites = item.sites.filter(site => site.name.indexOf(inputText.value) != -1)
    return item.sites.length > 0;
  });
}
</script>

<template>
  <div>
    <div id="input-div">
      <input id="search" type="search" v-on:keyup="increment" placeholder="请输入网站分组或网站名称" v-model="inputText" />
    </div>
    <div id="box" v-for="site in sites">
      <div class="forshow middle">
        <div class="flex"></div>
        <div class="img_setH">{{ site.groupName }}</div>
        <div class="flex"></div>
      </div>
      <div class="group-a">
        <a v-for="siteA in site.sites" class="group-a-tag" :href="siteA.url" target="_blank">{{ siteA.name }}
        </a>
      </div>
    </div>
  </div>
</template>
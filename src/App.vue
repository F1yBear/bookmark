<script setup>
import { ref } from 'vue'
import jsonData from './data.json?raw'
let inputText = ref("")
let data = eval(jsonData);
let sites = ref(data)
function increment() {
  sites.value = eval(jsonData);
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
    <div id = "input-div">
      <input id="search" type="search" v-on:keyup="increment" placeholder="请输入网站分组或网站名称" v-model="inputText" />
    </div>
    <div  id="box" v-for="site in sites">
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
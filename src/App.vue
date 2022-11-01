<script setup>
import { ref } from 'vue'
import request from './http/request'
let data = [];
let sites = ref(data);
var req = getRequest();
request.get((req.file?req.file:"ys")+'Data.json?')
  .then(function (response) {
    data = eval(response.data);
    sites.value = JSON.parse(JSON.stringify(data));
  });

let inputText = ref(req.keyword)
function increment() {
  sites.value = JSON.parse(JSON.stringify(data));
  sites.value = sites.value.filter(item => {
    if (inputText.value.trim() == "") {
      return true;
    }
    var matchGroupName = item.groupName.indexOf(inputText.value) != -1;
    if (matchGroupName) {
      return matchGroupName;
    }
    item.sites = item.sites.filter(site => site.name.indexOf(inputText.value) != -1)
    return item.sites.length > 0;
  });
}


function getRequest() {
   //获取url中"?"符后的字串
  var url = decodeURI(window.location.search);
  var theRequest = new Object();
  if (url.indexOf("?") != -1) {
    var str = url.substring(1);
    var strs = str.split("&");
    for (var i = 0; i < strs.length; i++) {
      var kv = strs[i].split("=")
      theRequest[kv[0]] = kv[1];
    }
  }
  return theRequest;
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
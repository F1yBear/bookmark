<script setup>
import { ref } from 'vue'
const sites = [
  {
    "groupName":"禹数产品网站",
    "sites":[
      {
        "name":"dev-saas",
        "url":"https://dev-saas.boss.yushu.center",
      },
      {
        "name":"qa-saas",
        "url":"https://qa-saas.boss.yushu.center",
      },
      {
        "name":"pre-saas",
        "url":"https://pre-saas.boss.yushu.center",
      },
      {
        "name":"prod-saas",
        "url":"https://saas.boss.yushu.center",
      }
    ]
},
{
    "groupName":"技术构建网站",
    "sites":[
      {
        "name":"dev-saas",
        "url":"https://dev-saas.boss.yushu.center",
      },
      {
        "name":"qa-saas",
        "url":"https://qa-saas.boss.yushu.center",
      },
      {
        "name":"pre-saas",
        "url":"https://pre-saas.boss.yushu.center",
      },
      {
        "name":"prod-saas",
        "url":"https://saas.boss.yushu.center",
      }
    ]
},
{
    "groupName":"测试网站",
    "sites":[
      {
        "name":"dev-saas",
        "url":"https://dev-saas.boss.yushu.center",
      },
      {
        "name":"qa-saas",
        "url":"https://qa-saas.boss.yushu.center",
      },
      {
        "name":"pre-saas",
        "url":"https://pre-saas.boss.yushu.center",
      },
      {
        "name":"prod-saas",
        "url":"https://saas.boss.yushu.center",
      }
    ]
}
  ]
</script>

<template>
  <div v-for="site in sites">
      <div class="forshow middle">
            <div class="flex"></div>
            <div class="img_setH">{{site.groupName}}</div>
            <div class="flex"></div>
        </div>
        <div class="group-a">
          <a v-for="siteA in site.sites" 
          class="group-a-tag" 
          href="{{siteA.url}}" 
          target="_blank">{{siteA.name}}
        </a>
        </div>
  </div>
</template>

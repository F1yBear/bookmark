import axios from 'axios'
//超时时间
axios.defaults.timeout = 50000
//跨域凭证
axios.defaults.withCredentials = false
switch (process.env.NODE_ENV) {
    case 'development':{
        axios.defaults.baseURL = "/"
        break
    }
    case 'production':{
        axios.defaults.baseURL = "https://f1ybear.github.io/bookmark/"
        break
    }
}

//响应和请求 拦截器配置

export default axios

document.addEventListener('DOMContentLoaded', function(){
  const postForm = document.getElementById('item-image')
  const previewList = document.getElementById('previews')
  if (!postForm) return null

  const fileField = document.querySelector('input[type="file"][name="item[image]"]')
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    const file = e.target.files[0]
    const blob = window.URL.createObjectURL(file)
  })
})
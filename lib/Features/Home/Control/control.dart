class Control{

  bool isWishListed(String courseId,List wishList){
    for(var item in wishList){
      if(item == courseId) return true;
    }
    return false;
  }

}
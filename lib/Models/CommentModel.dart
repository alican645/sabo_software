

class CommentModel {
  int? commentId;
  String? userName;
  String? commentDate;
  String? comment;
  int? commentScore;

  CommentModel(
      {this.commentId,this.userName, this.commentDate, this.comment, this.commentScore});

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    userName = json['user_name'];
    commentDate = json['comment_date'];
    comment = json['comment'];
    commentScore = json['comment_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['user_name'] = this.userName;
    data['comment_date'] = this.commentDate;
    data['comment'] = this.comment;
    data['comment_score'] = this.commentScore;
    return data;
  }
}
﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace NewNationals.Areas.AdminControlPanel.Models
{
    public class PageModels
    {
        public long Id { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên bài viết")]
        [MaxLength(350,ErrorMessage = "Tên bài viết không vượt quá 350 ký tự!")]
        [Display(Name = "Tên bài viết")]
        public string Name { get; set; }

        [Display(Name = "Đường dẫn Url")]
        public string Url { get; set; }

        [Display(Name = "Thẻ tiêu đề (dùng cho SEO)")]
        [MaxLength(250, ErrorMessage = "Thẻ tiêu đề không vượt quá 250 ký tự!")]
        public string Title { get; set; }

        [Display(Name = "Thẻ từ khóa (dùng cho SEO)")]
        [MaxLength(250, ErrorMessage = "Thẻ từ khóa không vượt quá 250 ký tự!")]
        public string Keywords { get; set; }

        [Display(Name = "Thẻ mô tả (dùng cho SEO)")]
        [MaxLength(250, ErrorMessage = "Thẻ mô tả không vượt quá 250 ký tự!")]
        public string Description { get; set; }

        [Display(Name = "Trạng thái")]
        public int Status { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime CreateDate { get; set; }

        [Display(Name = "Ngày cập nhật")]
        public DateTime ModifiedDate { get; set; }

        [Display(Name = "Người tạo")]
        public long UserCreate { get; set; }

        [Display(Name = "Người cập nhật")]
        public long UserModified { get; set; }

        [Display(Name = "Hình ảnh")]
        [MaxLength(250, ErrorMessage = "Đường dẫn ảnh không vượt quá 250 ký tự!")]
        public string Thumbnail { get; set; }

        [Display(Name = "Nội dung")]
        public string Content { get; set; }

        [Display(Name = "Tóm tắt")]
        [MaxLength(512, ErrorMessage = "Tóm tắt không vượt quá 512 ký tự!")]
        public string Note { get; set; }

        [Display(Name = "Hiển thị trong bài viết Nổi Bật")]
        public bool Feature { get; set; }

        [Display(Name = "Hiển thị trong bài viết Sự Kiện")]
        public bool Home { get; set; }

        [Display(Name = "Chuyên mục")]
        public long? CategoriesId { get; set; }

        [Display(Name = "Chọn kiểu cho bài viết")]
        public string Taxanomy { get; set; }

        [Display(Name = "Tag")]
        public string Tag { get; set; }

        [StringLength(50)]
        [Display(Name = "File đính kèm")]
        public string FileAttach { get; set; }

        [Display(Name = "Liên kết")]
        public string LinkRelated { get; set; }

        [Display(Name = "Chọn Template")]
        public string TemplatePage { get; set; }

        [Display(Name = "Tác giả")]
        public string TacGia { get; set; }

        [Display(Name = "Tổ chức")]
        public string ToChuc { get; set; }

        [Display(Name = "Thời gian sự kiện (nếu cần cho sự kiện)")]
        public DateTime TimeEvents { get; set; }

        [Display(Name = "Năm xuất bản bài viết (nếu có)")]
        [Range(0,int.MaxValue, ErrorMessage = "Vui lòng nhập chính xác năm")]
        public int YearPost { get; set; }
    }
}
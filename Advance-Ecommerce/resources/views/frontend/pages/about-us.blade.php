@extends('frontend.layouts.master')

@section('title','FastFood | Về chúng tôi')

@section('main-content')

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">Trang chủ<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">Về chúng tôi</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- About Us -->
	<section class="about-us section">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-12">
						<div class="about-content">
							@php
								$settings=DB::table('settings')->get();
							@endphp
							<h3>Chào mừng đến với <span>FastFood</span></h3>
							<p>Điểm làm nên đặc trưng ở FastFood Mlem chính là những chiếc burger đa dạng thể loại và những miếng gà rán giòn rụm.

							Chưa hết, FastFood Mlem còn khéo chiều lòng người dùng khi đưa ra các phần combo khác nhau, đáp ứng được mọi khẩu vị, kể cả thực khách "khó tính" nhất . Một phần combo đầy đủ ở đây sẽ có giá từ 85.000 đồng, một mức giá không phải quá đắt nhưng cũng khiến bạn phải "đau đầu" nếu như lỡ thèm vào những ngày cuối tháng.

							Nào, hãy cùng điểm qua những món ăn siêu ngon, siêu tiện lợi mà bạn có thể thoải mái phối hợp trong những combo trên. Cuối tháng không lo hết tiền, không lo thiếu đồ ăn ngon, vì đã có FastFood Mlem</p>
							<div class="button">
								<a href="{{route('blog')}}" class="btn">Bài viết của chúng tôi</a>
								<a href="{{route('contact')}}" class="btn primary">Liên hệ</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-12">
						<div class="about-img overlay">
							<img src="@foreach($settings as $data) {{$data->photo}} @endforeach" alt="@foreach($settings as $data) {{$data->photo}} @endforeach">
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- End About Us -->
@endsection

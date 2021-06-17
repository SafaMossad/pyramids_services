import 'package:flutter/material.dart';
import '../models/all_employee_model.dart';

class EmployeeProfile with ChangeNotifier {
  List<EmployeeProfileModel> _items = [
    EmployeeProfileModel(
      id: 1,
      orders: 3,
      phone: "01064327718",
      name: "صفا مسعد",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "مدينة نصر",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    EmployeeProfileModel(
      id: 1,
      orders: 10,
      phone: "01064327718",
      name: "محمد احمد",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "6 اكتوبر",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    EmployeeProfileModel(
      id: 2,
      orders: 15,
      phone: "01064327718",
      name: "يوسف عكه",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "شبرا الخيمة",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    EmployeeProfileModel(
      id: 3,
      orders: 20,
      phone: "01064327718",
      name: "محمد صلاح",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "قليوب البد",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    EmployeeProfileModel(
      id: 4,
      orders: 2,
      phone: "01064327718",
      name: "محمود ابراهيم",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "الزمالك",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    EmployeeProfileModel(
      id: 5,
      orders: 13,
      phone: "01064327718",
      name: "احمد حماده",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "حلوان",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    EmployeeProfileModel(
      id: 6,
      orders: 12,
      phone: "01064327718",
      name: "ابراهيم عواض ",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "المعادي",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    EmployeeProfileModel(
      id: 7,
      orders: 8,
      phone: "01064327718",
      name: "كريم طارق",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "العباسية",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    EmployeeProfileModel(
      id: 8,
      orders: 40,
      phone: "01064327718",
      name: "احمد محمود",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "الشيخ زايد",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    EmployeeProfileModel(
      id: 9,
      orders: 25,
      phone: "01064327718",
      name: "عمرو محمد",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "مدينة نصر",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    EmployeeProfileModel(
      id: 10,
      orders: 29,
      phone: "01064327718",
      name: "عمار ابو زيد",
      description:
          "يعمل النجار في مُختلف أدوات البناء وتحديدًا الخشب سواءً كان ذلك في موقع البناء أم في مشغله الخاص.  ويقوم بقص وتشكيل وقطع الخشب ويقوم بالنهاية بتركيب المنتج الذي صنعه مثل الأبواب والشبابيك والألواح الأرضية وغيرها.",
      location: "الشيخ زايد",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
  ];

  List<EmployeeProfileModel> get items {
    return [..._items];
  }
}

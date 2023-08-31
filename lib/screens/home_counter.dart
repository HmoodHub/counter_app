import 'package:counter/theme/app_theme.dart';
import 'package:counter/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_bloc/counter_bloc.dart';

class HomeCounter extends StatelessWidget {
  const HomeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = context.read<CounterBloc>();
    return BlocConsumer<CounterBloc, CounterState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is IncrementValueState) {
          appSnackBar(
            context,
            content: const Text('Increment value success'),
          );
        }
        if (state is DecrementValueState) {
          appSnackBar(
            context,
            content: const Text('Decrement value success'),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'COUNTER',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppTheme.primaryColor,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${state.counterValue}',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => bloc.add(IncrementValue()),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                            backgroundColor: AppTheme.color1
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Icon(Icons.add,color: Colors.white,),
                              SizedBox(width: 8,),
                              Text('Increment',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => bloc.add(DecrementValue()),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                              backgroundColor: AppTheme.color2

                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Icon(Icons.minimize,color: Colors.white,),
                              ),
                              SizedBox(width: 8,),
                              Text('Decrement',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
